import json, os, pathlib;
import from agents.supervisor { run }


def main(repo: Any = 'https://github.com/pallets/click') {
    <>root = pathlib.Path(__file__).resolve().parents[ 1 ];
    os.chdir(<>root);
    idx = run(repo);
    docs = (<>root / 'docs');
    assert (docs / 'map.json').exists() , 'map.json not generated' ;
    assert (docs / 'readme_summaries.json').exists() , 'readme_summaries.json not generated' ;
    assert (docs / 'analysis.json').exists() , 'analysis.json not generated' ;
    for name in ['map.json', 'readme_summaries.json', 'analysis.json'] {
        with open((docs / name), 'r', encoding='utf-8') as f  {
            json.load(f);
        }
    }
    print('Γ£à Self-check passed. Docs index at:', idx);
}


with entry {
    if (__name__ == '__main__') {
        main();
    }
}

