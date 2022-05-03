"""
The snakefile that runs the pipeline.
# HPC
# on login node from pipeline dir
snakemake -s runner.smk -c 1 --use-conda --config Input=sras Output=bams  --conda-create-envs-only --conda-frontend conda
# to run
snakemake -s runner.smk -c 1 --use-conda --config Input=sras Output=bams  --conda-create-envs-only --conda-frontend conda --profile sra_to_bam
"""

# get the input and output folders 
OUTPUT = config['Output']
INPUT = config['Input']
BigJobMem = 24000


# Parse the samples and read files
include: "rules/samples.smk"
sampleReads = parseSamples(INPUT)
SAMPLES = sampleReads.keys()

# Import rules and functions
include: "rules/targets.smk"
include: "rules/convert.smk"

rule all:
    input:
        ConvertFiles
