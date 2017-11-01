cwlVersion: v1.0
class: Workflow
inputs:
  protein_pdb: File
  protein_top: File
  protein_itp: File
  ligand_pdb: File
  ligand_top: File
  ligand_itp: File
  force_field: string
  sim_time: double

outputs:
  gromitout:
    type: File
    outputSource: gromit/gromitout
  gromiterr:
    type: File
    outputSource: gromit/gromiterr
  gromacslog_step2:
    type: File
    outputSource: gromit/gromacslog_step2
  gromacslog_step3:
    type: File
    outputSource: gromit/gromacslog_step3
  gromacslog_step4:
    type: File
    outputSource: gromit/gromacslog_step4
  gromacslog_step5:
    type: File
    outputSource: gromit/gromacslog_step5
  gromacslog_step6a:
    type: File
    outputSource: gromit/gromacslog_step6a
  gromacslog_step6b:
    type: File
    outputSource: gromit/gromacslog_step6b
  gromacslog_step7:
    type: File
    outputSource: gromit/gromacslog_step7
  gromacslog_step8:
    type: File
    outputSource: gromit/gromacslog_step8
  gromacslog_step9:
    type: File
    outputSource: gromit/gromacslog_step9
  trajectory:
    type: File
    outputSource: gromit/trajectory

steps:
  gromit:
    run: mdstudio/gromit.cwl
    in:
      protein_pdb: protein_pdb
      protein_top: protein_top
      protein_itp: protein_itp
      ligand_pdb: ligand_pdb
      ligand_top: ligand_top
      ligand_itp: ligand_itp
      force_field: force_field
      sim_time: sim_time
    out:
      - trajectory
      - gromitout
      - gromiterr
      - gromacslog_step2
      - gromacslog_step3
      - gromacslog_step4
      - gromacslog_step5
      - gromacslog_step6a
      - gromacslog_step6b
      - gromacslog_step7
      - gromacslog_step8
      - gromacslog_step9
