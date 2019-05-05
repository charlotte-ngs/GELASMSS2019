## ----setup, include=FALSE------------------------------------------------
# knitr::opts_chunk$set(echo = FALSE, results = 'asis', fig.pos = 'H')
knitr::knit_hooks$set(hook_convert_odg = rmddochelper::hook_convert_odg)

## ------------------------------------------------------------------------
s_data_path_gel_ex2 <- "https://charlotte-ngs.github.io/GELASMSS2019/ex/w12/data_bp_w12.csv"
tbl_gel_ex2 <- readr::read_csv2(file = s_data_path_gel_ex2)
colnames(tbl_gel_ex2);dim(tbl_gel_ex2)

## ------------------------------------------------------------------------
tbl_gel_ex2$sex <- as.factor(tbl_gel_ex2$sex)
tbl_gel_ex2$slh <- as.factor(tbl_gel_ex2$slh)
tbl_gel_ex2$hrd <- as.factor(tbl_gel_ex2$hrd)

## ------------------------------------------------------------------------
ped <- pedigreemm::pedigree(sire  = tbl_gel_ex2$sire, 
                            dam   = tbl_gel_ex2$dam,
                            label = tbl_gel_ex2$Id)

## ------------------------------------------------------------------------
require(pedigreemm)
# according to https://stat.ethz.ch/pipermail/r-sig-mixed-models/2014q1/021609.html
options(lmerControl=list(check.nobs.vs.nlev="ignore",
     check.nobs.vs.rankZ = "ignore",
     check.nobs.vs.nRE="ignore"))
# lmem_gel_ex2 <- pedigreemm(cw ~ sex + slh + hrd + age + (1|Id), data = tbl_gel_ex2, pedigree = list(Id = ped))
s_lmem_file <- "lmem_gel_ex2.rds"
if (file.exists(s_lmem_file)){
  load(file = s_lmem_file)
} else {
  lmem_gel_ex2 <- pedigreemm(cw ~ (1|Id), data = tbl_gel_ex2, pedigree = list(Id = ped))
  saveRDS(lmem_gel_ex2, file = s_lmem_file)
}
summary(lmem_gel_ex2)

