#' ---
#' title: Solution to Ex 04 P01
#' author: Peter von Rohr
#' date: 2019-03-18
#' ---

#' # Background
#' This script is a protocol of the demo solution that was during the 
#' exercise hour on 2019-03-18. The purpose was to introduce all the 
#' students to the concepts of using mixed linear effects models to 
#' predict breeding values using a BLUP animal model.
#' 
#' # Steps of the analysis
#' Read input from csv files,  start with observations
s_phe_path <- "https://charlotte-ngs.github.io/GELASMSS2019/ex/w05/data_ex04_phe.csv"
tbl_phe <- readr::read_csv(file = s_phe_path)

#' Read the pedigree
s_ped_path <- "https://charlotte-ngs.github.io/GELASMSS2019/ex/w05/data_ex04_ped.csv"
tbl_ped <- readr::read_csv(file = s_ped_path)


#' Create the design matrices X and Z
n_obs <- nrow(tbl_phe)
X <- matrix(1, nrow=n_obs, ncol=1)

n_animal <- nrow(tbl_ped)
Z <- diag(nrow = n_animal)

#' pedigree based on tbl_ped
?pedigreemm::pedigree

#' construct pedigree object
ped <- pedigreemm::pedigree(sire = tbl_ped$Sire, dam = tbl_ped$Dam, label = as.character(tbl_ped$Animal))

#' inverse of A
Ainv <- as.matrix(pedigreemm::getAInv(ped = ped))
Ainv

#' lambda from Problem
genvar <- 25
resvar <- 75
lambda <- resvar/genvar

#' vector of observations
y <- tbl_phe$Observation
y

#' Matrix M corresponding to the coefficient matrix of the MME
xtx <- crossprod(X)
xtx
xtz <- crossprod(X,Z)
xtz
ztx <- t(xtz)
ztx
ztzlainv <- crossprod(Z) + lambda * Ainv
ztzlainv
#' Putting together all the components
M <- rbind(cbind(xtx,xtz), cbind(ztx, ztzlainv))
M

#' defining the right-hand side
r <- rbind(crossprod(X,y), crossprod(Z,y))
r

#' Computing the solution
l <- solve(M,r)
l

