import from tools.git_tools { clone }
import from agents.repo_mapper { build_map }
import from tools.summarizer { readme_outline_and_summaries }
import from agents.code_analyzer { deep_dive }
import from agents.docgenie { render }
import from pathlib { Path }


def run(repo_url_or_path: str, work: Any = 'workspace') {
    work = Path(work);
    work.mkdir(exist_ok=True);
    if repo_url_or_path.startswith('http') {
        repo_path = str((work / 'repo'));
        clone(repo_url_or_path, repo_path);
    }
        else
        {
        repo_path = repo_url_or_path;
        }

    build_map(repo_path);
    readme_outline_and_summaries(repo_path);
    deep_dive(repo_path);
    index = render('docs');
    return str(index);
}

