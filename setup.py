from setuptools import setup, find_packages

setup(
    name='jetson-voice',
    version='0.1',
    packages=find_packages(),
    package_data={
        'jetson_voice': [
            'data/tests/*.json', 
            'data/audio/tts_examples/*.wav'
            'data/audio/*.wav',
            'data/config/training/*.yaml',
            'data/networks/*.json'
            ],
    },
    description='ASR/NLP/TTS deep learning inference library for NVIDIA Jetson using PyTorch and TensorRT',
)
