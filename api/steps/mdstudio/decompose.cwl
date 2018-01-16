cwlVersion: v1.0

class: CommandLineTool
baseCommand: $CERISE_API_FILES/mdstudio/github/cerise-mdstudio-das5/mdstudio/energies/call_decompose.sh
arguments: ["$CERISE_API_FILES"]
stdout: decompose.out
stderr: decompose.err

inputs:
  res:
    type: int[]
    inputBinding:
       position: 1
       itemSeparator: ","
       prefix: -res     
  gro:
    type: File
    inputBinding:
       position: 2
       prefix: -gro
  ndx:
    type: File
    inputBinding:
       position: 3
       prefix: -ndx
  trr:
    type: File
    inputBinding:
       position: 4
       prefix: -trr
  top:
    type: File
    inputBinding:
       position: 5
       prefix: -top
  mdp:
    type: File
    inputBinding:
      position: 6
      prefix: -mdp

outputs:
  decompose_dataframe:
    type: File
    outputBinding: { glob: "decompose.ene" }
  decompose_err:
    type: File
    outputBinding: { glob: "decompose.err" }
  decompose_out:
    type: File
    outputBinding: { glob: "decompose.out" }
