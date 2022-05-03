# SRA_to_BAM
Snakemake Pipeline to Parallelise Conversion of SRA to BAM files

#### This is a Work in Progress.

# Usage

1. Download the conda envs for offline use:
```console
snakemake -s runner.smk -c 1 --use-conda --config Input='/hpcfs/users/a1667917/Kenny/RNA_Seq_SRA/PRJNA453457/sras' Output='/hpcfs/users/a1667917/Kenny/RNA_Seq_SRA/PRJNA453457/bams'  --conda-create-envs-only --conda-frontend conda
```

2. Run the pipeline

```console
snakemake -s runner.smk -c 1 --use-conda --config Input='/hpcfs/users/a1667917/Kenny/RNA_Seq_SRA/PRJNA453457/sras' Output='/hpcfs/users/a1667917/Kenny/RNA_Seq_SRA/PRJNA453457/bams'  --conda-create-envs-only --conda-frontend conda --profile sra_to_bam
```

* With a Slurm profile (see https://snakemake.readthedocs.io/en/stable/executing/cli.html https://github.com/Snakemake-Profiles/slurm https://fame.flinders.edu.au/blog/2021/08/02/snakemake-profiles-updated)
* You will need to cd to the pipeline directory in your jobscript before running if you want to run this offline (to use the premade conda envs)
* Use the ReadLength flag to set the STAR index


#### Other notes
* The only reason this exists is because sam-dump takes forever
