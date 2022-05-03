#!/bin/bash -l

#SBATCH --job-name=sra_to_bam_PRJNA523380
#SBATCH --mail-user=george.bouras@adelaide.edu.au
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --err="sra_to_bam_PRJNA523380_snk.err"
#SBATCH --output="sra_to_bam_PRJNA523380_snk.out"

# Resources allocation request parameters
#SBATCH -p batch
#SBATCH -N 1                                                    # number of tasks (sequential job starts 1 task) (check this if your job unexpectedly uses 2 nodes)
#SBATCH -c 1                                                    # number of cores (sequential job calls a multi-thread program that uses 8 cores)
#SBATCH --time=2-23:00:00                                         # time allocation, which has the format (D-HH:MM), here set to 1 hou                                           # generic resource required (here requires 1 GPUs)
#SBATCH --mem=4GB                                              # specify memory required per node


SNK_DIR="/hpcfs/users/a1667917/Kenny/RNA_Seq_SRA/SRA_to_BAM"
PROF_DIR="/hpcfs/users/a1667917/snakemake_slurm_profile"

cd $SNK_DIR

module load Anaconda3/2020.07
conda activate snakemake_clean_env

snakemake -s runner.smk -c 1 --use-conda --config Input='/hpcfs/users/a1667917/Kenny/RNA_Seq_SRA/PRJNA453457/sras' Output='/hpcfs/users/a1667917/Kenny/RNA_Seq_SRA/PRJNA453457/bams' \
 --conda-create-envs-only --conda-frontend conda --profile $PROF_DIR/wgs_tcga
conda deactivate
