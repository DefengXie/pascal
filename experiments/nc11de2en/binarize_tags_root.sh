#!/bin/bash

# Created by:         Emanuele Bugliarello (@e-bug)
# Date created:       9/4/2019
# Date last modified: 9/4/2019

src=de
tgt=en
PROJ=$HOME/pascal
INPUT=$PROJ/data/nc11deen/tags_root
OUTPUT=$INPUT/nc11${src}2${tgt}

# activate environment
source activate pascal

# Binarize the dataset:
cd $PROJ/fairseq
python preprocess.py \
	--source-lang $src \
	--target-lang $tgt \
	--trainpref $INPUT/train \
	--validpref $INPUT/valid \
	--testpref $INPUT/test \
	--destdir $OUTPUT \
	--workers 16 \
	--only-source

# deactivate environment
conda deactivate
