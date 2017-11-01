import cerise_client.service as cs
import time

# Create a service in a local Docker container
srv = cs.require_managed_service(
        'cerise-mdstudio-gt-myuser', 29593,
        'cerise-mdstudio-gt',
        'username',
        'password')

cs.start_managed_service(srv)

# Create a job
job = srv.create_job('example_job')
job.set_workflow('./md_workflow.cwl')
job.add_input_file('protein_pdb', 'CYP19A1vs.pdb')
job.add_input_file('protein_top', 'CYP19A1vs.top')
job.add_input_file('protein_itp', 'CYP19A1vs-posre.itp')
job.add_input_file('ligand_pdb', 'BHC89.pdb')
job.add_input_file('ligand_top', 'BHC89.itp')
job.add_input_file('ligand_itp', 'BHC89-posre.itp')
job.set_input('force_field', 'amber99SB')
job.set_input('sim_time', 0.001)

# Start it
job.run()

while job.is_running():
    time.sleep(1)

if job.state == 'Success':
    job.outputs['trajectory'].save_as('CYP19A1vs_BHC89.trr')
else:
    print('There was an error: ' + job.state)
    print(job.log)

for key in job.outputs:
    job.outputs[key].save_as(key)

# Clean up the job and the service
srv.destroy_job(job)
cs.destroy_managed_service(srv)
