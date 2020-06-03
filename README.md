# Coffea analysis running on a SLURM cluster using Spark

These are example deployment scripts for the Hammer cluster.
They use a local SPARK installation instead of the system-wide one. This provides more flexibility for using additional packages.

Run setup-client.sh and setup-sever.sh once. 

Then, run start-master.sh to start the master.
Adjust the 'reservation' in submit-worker.sh before submitting the workers via SLURM. 

Finally, start-jupyter.sh to load jupyter.
NOTE: Make sure Firefox starts a fresh, local instance, and not some remote session as it normally does!
Hint: starting the ThinLinc (aka 'Remote Desktop') on another cluster helps!

Run the example 'spark-laurelin.ipynb' under 'notebooks'
Try both modes: LOCAL_EXECUTION_MODE=True/False
You need to start your own Spark master and workers in the second case, and enter it's address in the masterURL field.

If everything works fine, you should get a nice di-muon invariant mass plot in the last cell on the Jupyter notebook.
