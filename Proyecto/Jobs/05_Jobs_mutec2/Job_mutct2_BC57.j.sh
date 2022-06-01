#$ -S /bin/bash
#
# Your job name
#$ -N BC57j.mt2
#
# Use current working directory
#$ -cwd
#
# Join stdout and stderr
#$ -j y
#
# If modules are needed, source modules environment (Do not delete the next line):
. /etc/profile.d/modules.sh
#
# Add any modules you might require:
module load gatk/4.1.6.0
#
#pe (Parallel environment)request a parallel environment (MPI, OpenMP). Set your
number of requested slots here.
#A continuación, número de hilos pedidos a máquina
#$ -pe mpich 4
#
# Write your commands in the next line
gatk Mutect2 \
-R chrM.hg38.THjnct.fa \
-I BC57.j.bam.sort \
-O BC57j.vcf.gz \
-L chrM:1500-4570 \
--mitochondria-mode \
--active-probability-threshold 0.000001 \
--base-quality-score-threshold 6 \
--callable-depth 5 \
--downsampling-stride 1 \
--f1r2-max-depth 1000000 \
--force-active \
--max-mnp-distance 0 \
--max-population-af 1 \
--max-reads-per-alignment-start 0 \
--min-base-quality-score 30 \
--dont-use-soft-clipped-bases \
--phred-scaled-global-read-mismapping-rate 30
