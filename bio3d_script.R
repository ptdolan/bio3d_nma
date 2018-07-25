library(bio3d)
PDB<-read.pdb2(file = "~/hsp90ab_5fwk.pdb")
PDBnma<-aanma.pdb(pdb = PDB)

for (file in c("~/PHE-508-ALA_3pry.pdb.pdb",
"~/PHE-508-ILE_3pry.pdb.pdb",
"~/PHE-508-SER_3pry.pdb.pdb",
"~/PHE-508-MET_3pry.pdb.pdb")){
  mutPDB<-read.pdb2(file = file)
  mutPDBnma<-aanma.pdb(mutPDB,rm.wat = T)
  pdf(plot(nma.pdb,main=file))
}
