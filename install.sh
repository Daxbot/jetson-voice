#!/bin/bash

# Check if user is root
if [ $(id -u) != "0" ]; then
    echo "Error: You must be root to run this script!"
    exit 1
fi

apt install -y llvm-8-dev
apt install -y portaudio19-dev python3-pyaudio
apt install -y libomp-dev

pip3 install tqdm
pip3 install colorama
pip3 install llvmlite
pip3 install numba

pip3 install audioread
pip3 install resampy
pip3 install soundfile

pip3 install librosa==0.9.1
pip3 install pooch
pip3 install pyaudio
pip3 install testresources
pip3 install inflect
pip3 install nltk

pip3 install --upgrade protobuf~=3.20
pip3 install numpy==1.23.5

pip3 install tokenizers --only-binary :all:
pip3 install transformers datasets

export PATH=/usr/local/cuda-11.4/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

pip3 install pycuda

pip3 install pillow
pip3 install torch --index-url https://download.pytorch.org/whl/cu118

git clone --recursive --branch v0.11.1 https://github.com/pytorch/text torchtext
cd torchtext
python3 setup.py clean install

rm torchtext -rf

pip3 install onnx==1.10.0

apt install -y libsndfile1 ffmpeg
pip install Cython
git clone --recursive --branch v1.6.2 https://github.com/nvidia/nemo

cp patches/nemo/1.6.2/requirements.txt nemo/requirements/requirements.txt
cp patches/nemo/1.6.2/requirements_nlp.txt nemo/requirements/requirements_nlp.txt

pip3 install -r nemo/requirements/requirements.txt
pip3 install -r nemo/requirements/requirements_asr.txt
pip3 install -r nemo/requirements/requirements_nlp.txt
pip3 install -r nemo/requirements/requirements_tts.txt

pushd nemo
python3 setup.py install
popd

apt install -y swig

git clone https://github.com/dusty-nv/OpenSeq2Seq -b ctc-decoders
pushd OpenSeq2Seq/decoders

# Fix for python3 -- For some reason it attemps to use python2
sed -i 's/python/python3/g' setup.py

./setup.sh
popd

# Install this package
pip3 install .