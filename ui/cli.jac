import sys, pathlib, argparse;


with entry {
    sys.path.append(str(pathlib.Path(__file__).resolve().parents[ 1 ]));
}
import from agents.supervisor { run }
def main() {
    p = argparse.ArgumentParser();
    p.add_argument('repo', help='GitHub URL or local path');
    args = p.parse_args();
    print('Docs index:', run(args.repo));
}


with entry {
    if (__name__ == '__main__') {
        main();
    }
}

