library(bio3d)
for (f in list.files("~/GitHub/bio3d_nma/Structures/",pattern = ".pdb")){
  mutPDB<-read.pdb2(file = f)
  mutPDBnma<-aanma.pdb(mutPDB)
  
  pdf(paste(file,".pdf"))
  plot(nma.pdb,main=file)
  dev.off()
}
