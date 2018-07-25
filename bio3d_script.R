library(bio3d)
library(data.table)
allFluct<-NULL
for (f in list.files("~/GitHub/bio3d_nma/Structures/",pattern = ".pdb",full.names = T)){
#  mutPDB<-read.pdb2(file = f)
#  mutPDBnma<-aanma.pdb(mutPDB)
  
  pdf(paste(strsplit(f,split = ".pdb")[[1]][1],".pdf"),width=6,height=5)
  plot(mutPDBnma)
  dev.off()
  
  resno<-as.integer(limma::strsplit2(names(mutPDBnma$fluctuations),"_")[,1])
  fluct<-as.numeric(mutPDBnma$fluctuations)
  allFluct<-cbind(allFluct,fluct)
  atom<-data.table(mutPDB$atom)
  fluctuation<-data.frame(resno,fluct)
  atom[,b:=0]
  atom[,b:=fluctuation$fluct[fluctuation$resno==resno],by=eleno]
  mutPDB$atom<-atom
  write.pdb(pdb=mutPDB$atom$b,file = paste(strsplit(f,split = ".pdb")[[1]][1],"_FluctBfactor.pdb",sep=""))
  }
