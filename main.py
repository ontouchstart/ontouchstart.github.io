import this
import subprocess
print()
print(subprocess.run(["system_profiler", "Hardware", "SPDisplaysDataType"], capture_output=True, text=True, check=True).stdout)
