import tarfile
import sys

def python_tar(source, output):
    with tarfile.open(output, "w:gz") as tar:
        tar.add(source, arcname=".") # arcname="." -> flattens structure passed

if __name__ == '__main__':
    python_tar(sys.argv[1], sys.argv[2])
