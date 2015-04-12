import os
import subprocess
import sys
import re

if len(sys.argv) == 1:
	print("Please specify a hexadecimal color code")
elif len(sys.argv) > 2:
	print("Too many arguments specified")
else:
	color_code = str(sys.argv[1])
if re.match('\#?[0-9A-Fa-f]{3}|\#?[0-9A-Fa-f]{6}', color_code) is None:
	print("Invalid color format. Please specify a 3 or 6 digit hexadecimal color code.")
if not color_code.startswith("#"):
	color_code = "#" + color_code

script_path = os.path.dirname(os.path.realpath(__file__))
image_input_dir = os.path.join(script_path, "icons")
image_output_dir = os.path.join(script_path, "../icons")

image_command = "mogrify -fill '"+ color_code +"' -opaque '#fff' -path "+ image_output_dir + " "+ image_input_dir +"/*.png"

subprocess.call(image_command, shell=True)
