complete -fc pre-commit

## global flags

complete -c pre-commit \
  -s h -l help \
  -d "show help message and exit"

complete -c pre-commit \
  -s v -l version \
  -d "show version number and exit"

## top-level subcommands

complete -fc pre-commit \
  -n '__fish_use_subcommand || __fish_seen_subcommand_of help' \
  -a autoupdate \
  -d "auto-update pre-commit config to the latest repos' versions"

complete -fc pre-commit \
  -n '__fish_use_subcommand || __fish_seen_subcommand_of help' \
  -a clean \
  -d "clean out pre-commit files"

complete -fc pre-commit \
  -n '__fish_use_subcommand || __fish_seen_subcommand_of help' \
  -a gc \
  -d "clean unused cached repos"

complete -fc pre-commit \
  -n '__fish_use_subcommand || __fish_seen_subcommand_of help' \
  -a init-templatedir \
  -d "install hook script in a directory intended for use with `git config init.templateDir`"

complete -fc pre-commit \
  -n '__fish_use_subcommand || __fish_seen_subcommand_of help' \
  -a install \
  -d "install the pre-commit script"

complete -fc pre-commit \
  -n '__fish_use_subcommand || __fish_seen_subcommand_of help' \
  -a install-hooks \
  -d "install hook environments for all environments in the config file. You may find `pre-commit install --install-hooks` more useful"

complete -fc pre-commit \
  -n '__fish_use_subcommand || __fish_seen_subcommand_of help' \
  -a migrate-config \
  -d "migrate list configuration to new map configuration"

complete -fc pre-commit \
  -n '__fish_use_subcommand || __fish_seen_subcommand_of help' \
  -a run \
  -d "run hooks"

complete -fc pre-commit \
  -n '__fish_use_subcommand || __fish_seen_subcommand_of help' \
  -a sample-config \
  -d "produce a sample .pre-commit-config.yaml file"

complete -xc pre-commit \
  -n '__fish_use_subcommand || __fish_seen_subcommand_of help' \
  -a try-repo \
  -d "try the hooks in a repository, useful for developing new hooks"

complete -fc pre-commit \
  -n '__fish_use_subcommand || __fish_seen_subcommand_of help' \
  -a uninstall \
  -d "uninstall the pre-commit script"

complete -fc pre-commit \
  -n '__fish_use_subcommand || __fish_seen_subcommand_of help' \
  -a validate-config \
  -d "validate .pre-commit-config.yaml files"

complete -fc pre-commit \
  -n '__fish_use_subcommand || __fish_seen_subcommand_of help' \
  -a validate-manifest \
  -d "validate .pre-commit-hooks.yaml files"

complete -fc pre-commit \
  -n '__fish_use_subcommand' \
  -a help \
  -d "show help for a specific command"

## shared flags across many subcommands

complete -xc pre-commit \
  -n '__fish_seen_subcommand_from autoupdate clean gc init-templatedir install install-hooks migrate-config run sample-config try-repo uninstall validate-config validate-manifest' \
  -l color \
  -a 'auto always never' \
  -d "Whether to use color in output. Defaults to `auto`."

complete -rc pre-commit \
  -n '__fish_seen_subcommand_from autoupdate init-templatedir install install-hooks migrate-config run try-repo uninstall' \
  -s c -l config \
  -d "Path to alternate config file"

set -l hookType commit-msg post-checkout post-commit post-merge post-rewrite pre-commit pre-merge-commit pre-push pre-rebase prepare-commit-msg
complete -xc pre-commit \
  -n '__fish_seen_subcommand_from init-templatedir install uninstall' \
  -s t -l hook-type \
  -a "$hookType" \
  -d "Hook to work with. Defaults to all."

## autoupdate flags

complete -fc pre-commit \
  -n '__fish_seen_subcommand_from autoupdate' \
  -l bleeding-edge \
  -d "Update to the bleeding edge of `HEAD` instead of the latest tagged version (the default behavior)."

complete -fc pre-commit \
  -n '__fish_seen_subcommand_from autoupdate' \
  -l freeze \
  -d "Store 'frozen' hashes in `rev` instead of tag names"

# TODO use --config if provided instead of a hard-coded file path
complete -xc pre-commit \
  -n '__fish_seen_subcommand_from autoupdate' \
  -l repo \
  -a"(grep repo: .pre-commit-config.yaml | cut -d':' -f2- | xargs -n1)" \
  -d "Only update this repository -- may be specified multiple times."

complete -xc pre-commit \
  -n '__fish_seen_subcommand_from autoupdate' \
  -s j -l jobs \
  -d "Number of threads to use. (default 1)."

## init-templatedir flags

complete -fc pre-commit \
  -n '__fish_seen_subcommand_from init-templatedir' \
  -l no-allow-missing-config \
  -d "Assume cloned repos should have a `pre-commit` config."

## install flags

complete -fc pre-commit \
  -n '__fish_seen_subcommand_from install' \
  -s f -l overwrite \
  -d "Overwrite existing hooks / remove migration mode."

complete -fc pre-commit \
  -n '__fish_seen_subcommand_from install' \
  -l install-hooks \
  -d "Whether to install hook environments for all environments in the config file."

complete -fc pre-commit \
  -n '__fish_seen_subcommand_from install' \
  -l allow-missing-config \
  -d "Whether to allow a missing `pre-commit` configuration file or exit with a failure code."

## run/try-repo flags

# TODO use --config if provided instead of a hard-coded file path
complete -fc pre-commit \
  -n '__fish_seen_subcommand_from run try-repo' \
  -a "(grep id: .pre-commit-config.yaml | cut -d':' -f2- | xargs -n1)" \
  -d "A single hook-id to run"

complete -xc pre-commit \
  -n '__fish_seen_subcommand_from run try-repo' \
  -l files \
  -a "(__fish_complete_path)" \
  -d "Specific filenames to run hooks on."

complete -fc pre-commit \
  -n '__fish_seen_subcommand_from run try-repo' \
  -l show-diff-on-failure \
  -d "When hooks fail, run `git diff` directly afterward."

complete -xc pre-commit \
  -n '__fish_seen_subcommand_from run try-repo' \
  -l hook-stage \
  -a "$hookType manual" \
  -d "The stage during which the hook is fired."

complete -xc pre-commit \
  -n '__fish_seen_subcommand_from run try-repo' \
  -l remote-branch \
  -d "Remote branch ref used by `git push`."

complete -xc pre-commit \
  -n '__fish_seen_subcommand_from run try-repo' \
  -l local-branch \
  -d " Local branch ref used by `git push`."

complete -xc pre-commit \
  -n '__fish_seen_subcommand_from run try-repo' \
  -l from-ref -l source -s s \
  -d "(for usage with `--to-ref`) -- this option represents the original ref in a `from_ref...to_ref` diff expression. For `pre-push` hooks, this represents the branch you are pushing to. For `post-checkout` hooks, this represents the branch that was previously checked out."

complete -xc pre-commit \
  -n '__fish_seen_subcommand_from ru try-repo' \
  -l to-ref -l origin -s o \
  -d "(for usage with `--from-ref`) -- this option represents the destination ref in a `from_ref...to_ref` diff expression. For `pre-push` hooks, this represents the branch being pushed. For `post-checkout` hooks, this represents the branch that is now checked out."

complete -xc pre-commit \
  -n '__fish_seen_subcommand_from run try-repo' \
  -l pre-rebase-upstream \
  -d "The upstream from which the series was forked."

complete -xc pre-commit \
  -n '__fish_seen_subcommand_from run try-repo' \
  -l pre-rebase-branch \
  -d "The branch being rebased, and is not set when rebasing the current branch."

complete -xc pre-commit \
  -n '__fish_seen_subcommand_from run try-repo' \
  -l commit-msg-filename \
  -d "Filename to check when running during `commit-msg`"

complete -xc pre-commit \
  -n '__fish_seen_subcommand_from run try-repo' \
  -l prepare-commit-message-source \
  -d "Source of the commit message (typically the second argument to .git/hooks/prepare-commit-msg)"

complete -xc pre-commit \
  -n '__fish_seen_subcommand_from run try-repo' \
  -l commit-object-name \
  -d "Commit object name (typically the third argument to .git/hooks/prepare-commit-msg)"

complete -xc pre-commit \
  -n '__fish_seen_subcommand_from run try-repo' \
  -l remote-name \
  -d "Remote name used by `git push`."

complete -xc pre-commit \
  -n '__fish_seen_subcommand_from run try-repo' \
  -l remote-url \
  -d "Remote url used by `git push`."

complete -xc pre-commit \
  -n '__fish_seen_subcommand_from run try-repo' \
  -l checkout-type \
  -d "Indicates whether the checkout was a branch checkout (changing branches, flag=1) or a file checkout (retrieving a file from the index, flag=0)."

complete -xc pre-commit \
  -n '__fish_seen_subcommand_from run try-repo' \
  -l is-squash-merge \
  -d "During a post-merge hook, indicates whether the merge was a squash merged"

complete -xc pre-commit \
  -n '__fish_seen_subcommand_from run try-repo' \
  -l rewrite-command \
  -d "During a post-rewrite hook, specifies the command that invoked the rewrite"

complete -fc pre-commit \
  -n '__fish_seen_subcommand_from run try-repo' \
  -s v -l verbose \
  -d "Be extra chatty"

complete -fc pre-commit \
  -n '__fish_seen_subcommand_from run try-repo' \
  -s a -l all-files \
  -d "Run on all the files in the repo."

## try-repo flags

complete -xc pre-commit \
  -n '__fish_seen_subcommand_from try-repo' \
  -l ref -l rev \
  -d "Manually select a rev to run against, otherwise the `HEAD` revision will be used."
