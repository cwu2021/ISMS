# https://stackoverflow.com/questions/2720014/how-to-upgrade-all-python-packages-with-pip
# For pip >= 10.0.1 to upgrade all Python packages with pip
import pkg_resources
from subprocess import call

packages = [dist.project_name for dist in pkg_resources.working_set]
call("pip install --upgrade " + ' '.join(packages), shell=True)

# upgrade specific packages using pip
# https://stackoverflow.com/questions/4536103/how-can-i-upgrade-specific-packages-using-pip-and-a-requirements-file
# https://stackoverflow.com/questions/4256107/running-bash-commands-in-python
bashCommand = "pip install Django --upgrade"
os.system(bashCommand)
