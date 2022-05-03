rule convert_to_sam:
    input:
        os.path.join(INPUT,"{sample}.sra"),
    output:
        os.path.join(OUTPUT,"{sample}.sam")
    conda:
        os.path.join('..', 'envs','convert.yaml')
    threads:
        1
    resources:
        mem_mb=MediumJobMem
    shell:
        """
        sam-dump {input[0]} > {output[0]}
        """

rule convert_to_bam:
    input:
        os.path.join(OUTPUT,"{sample}.sam"),
    output:
        os.path.join(OUTPUT,"{sample}.bam")
    conda:
        os.path.join('..', 'envs','convert.yaml')
    threads:
        1
    resources:
        mem_mb=MediumJobMem
    shell:
        """
        samtools view -b -S {input[0]} > {output[0]}
        """



rule aggr_convert:
    input:
        expand(os.path.join(OUTPUT,"{sample}.bam"), sample = SAMPLES)
    output:
        os.path.join(OUTPUT, "aggr_convert.txt")
    threads:
        1
    resources:
        mem_mb=MediumJobMem
    shell:
        """
        touch {output[0]}
        """







