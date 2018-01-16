cwlVersion: v1.0

class: CommandLineTool
baseCommand: $CERISE_API_FILES/mdstudio/github/cerise-mdstudio-das5/mdstudio/gromit/call_gromit.sh
arguments: ["$CERISE_API_FILES"]
stdout: gromit.out
stderr: gromit.err

inputs:
  ligand_pdb:
    type: File
    inputBinding:
      position: 1
  ligand_top:
    type: File
    inputBinding:
      position: 2
  protein_pdb:
    type: File?
    inputBinding:
       position: 3
       prefix: -f
  protein_top:
    type: File
    inputBinding:
       position: 4
       prefix: -top
  forcefield:
    type: string
    inputBinding:
      position: 5
      prefix: -ff
  periodic_distance:
    type: double
    inputBinding:
      position: 6
      prefix: -d
  pressure:
    type: double
    inputBinding:
      position: 7
      prefix: -p
  prfc:
    type: int[]
    inputBinding:
      position: 8
      prefix: -prfc
      itemSeparator: ","
  ptau:
    type: double
    inputBinding:
      position: 9
      prefix: -ptau
  resolution:
    type: double
    inputBinding:
      position: 10
      prefix: -at
  salinity:
    type: double
    inputBinding:
      position: 11
      prefix: -conc
  sim_time:
    type: double
    inputBinding:
      position: 12
      prefix: -time
  solvent:
    type: string
    inputBinding:
      position: 13
      prefix: -solvent
  temperature:
    type: int[]
    inputBinding:
      position: 14
      itemSeparator: ","
      prefix: -t
  ttau:
    type: double
    inputBinding:
      position: 15
      prefix: -ttau
outputs:
  gromitout:
    type: File
    outputBinding: { glob: gromit.out }
  gromiterr:
    type: File
    outputBinding: { glob: gromit.err }
  gromacslog_step2:
    type: File
    outputBinding: { glob: 02-PBC.log }
  gromacslog_step3:
    type: File
    outputBinding: { glob: 03-EMv.log }
  gromacslog_step4:
    type: File
    outputBinding: { glob: 04-SOLVATION.log }
  gromacslog_step5:
    type: File
    outputBinding: { glob: 05-EMs.log }
  gromacslog_step6a:
    type: File
    outputBinding: { glob: 06-PR-NVT-1.log }
  gromacslog_step6b:
    type: File
    outputBinding: { glob: 06-PR-NVT-2.log }
  gromacslog_step7:
    type: File
    outputBinding: { glob: 07-NPT-1.log }
  gromacslog_step8:
    type: File
    outputBinding: { glob: 08-MD-PRE.log }
  gromacslog_step9:
    type: File
    outputBinding: { glob: 09-MD.log }
  trajectory:
    type: File
    outputBinding: { glob: "*-MD.part0001.trr" }
  energy:
    type: File
    outputBinding: { glob: "*-MD.part*.edr" }
  gro:
    type: File
    outputBinding: { glob: "*-sol.gro" }
  ndx:
    type: File
    outputBinding: { glob: "*-sol.ndx" }
  top:
    type: File
    outputBinding: { glob: "*-sol.top" }
  mdp:
    type: File
    outputBinding: { glob: md-prod-out.mdp}
