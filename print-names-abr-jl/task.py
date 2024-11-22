import os

import argparse
arg_parser = argparse.ArgumentParser()

arg_parser.add_argument('--id', action='store', type=str, required=True, dest='id')


arg_parser.add_argument('--names', action='store', type=str, required=True, dest='names')

arg_parser.add_argument('--param_p', action='store', type=str, required=True, dest='param_p')

args = arg_parser.parse_args()
print(args)

id = args.id

import json
names = json.loads(args.names)

param_p = args.param_p


for name in names:
    print(f"Hello, {name}!")
x = 1
print(param_p)
print(os.getenv('API_ENDPOINT'))

import json
filename = "/tmp/x_" + id + ".json"
file_x = open(filename, "w")
file_x.write(json.dumps(x))
file_x.close()
