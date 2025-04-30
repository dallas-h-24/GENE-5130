#parsing the vcf 
library(dplyr)
library(readr)
circos_practice <- read.csv('Structural VCF reformatted.txt', header = T, sep = "\t")

subset <- circos_practice %>%
  select(X.CHROM, POS, QUAL) %>%
  rename(chr = X.CHROM, start = POS, value = QUAL) %>%
  mutate(
    chr = gsub('^chr', 'hs', chr),
    color = ifelse(value >= 100, "red",
                   ifelse(value >= 50, 'orange', 'blue'))
  ) %>%
  select(chr, start, value, color)
write.table(subset, 'circos_input.txt', quote = F, sep = "\t",
            row.names = F, col.names = F)
