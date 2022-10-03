#!/bin/bash

# functions	
activateLdm(){
	echo activateLdm
	conda activate ldm
	echo ldm Activated
}

setCondaPath(){	
	echo setCondaPath
	CONDA_PATH=$(conda info | grep -i 'base environment' | awk '{print $4}')
	source $CONDA_PATH/etc/profile.d/conda.sh
	echo Conda Path Set
}

preloadModels(){
	 echo preloadModels
	 python3 "$HOME/stable-diffusion/dream/scripts/preload_models.py"
	 echo Models preloaded
}

dream(){
	echo dream
	cd "$HOME/stable-diffusion/dream"
 	python3 "$HOME/stable-diffusion/dream/scripts/dream.py"
 	echo awaken
}

bootstrap(){
	setCondaPath
	activateLdm
}

executetxt2img(){
	echo runtxt2img
	python "$HOME/stable-diffusion/optimized/optimizedSD/optimized_txt2img.py \"$@\""
	echo txt2img run complete
}

executeimg2img(){
	echo runimg2img
	python "$HOME/stable-diffusion/optimized/optimizedSD/optimized_img2img.py \"$@\""
	echo img2img run complete
}

runtxt2img(){
	executetxt2img "$@"
}

runimg2img(){
	executeimg2img "$@"
}

rundream(){
	preloadModels
	dream
}

# execution
bootstrap
allArgs="$@"

echo "Select an action: "
echo "1) txt2img"
echo "2) img2img"
echo "3) dream"
echo "4) quit (also q)"

read action

case $action in
	1) runtxt2img allArgs;;
	2) runimg2img allArgs;;
	3) rundream;;
	4) exit;;
	q) exit;;
esac
