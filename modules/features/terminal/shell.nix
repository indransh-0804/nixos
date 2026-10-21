let 
  myAlias = {
     svim   = "sudo -E nvim";
     cat    = "bat";
     cd = "z";
     "..." = "cd ../..";
     "...." = "cd ../../..";

     # -- eza aliases --

     # basic listings
     ls    = "eza";                        # standard list
     l     = "eza -1";                     # one column
     la    = "eza -1a";                    # one column with hidden files
     ll    = "eza -l --icons always";                     # long format
     lla   = "eza -la --icons always";                    # long format with hidden files

     # filtered listings
     ld    = "eza -D";                     # directories only
     lld   = "eza -lD";                    # long format, directories only
     lf    = "eza -f";                     # files only
     llf   = "eza -lf";                    # long format, files only

     # sort variants
     lsz   = "eza -l --sort=size";         # sort by size
     lsx   = "eza -l --sort=extension";    # sort by extension
     ltm   = "eza -l --sort=modified";     # sort by modified time
     lcr   = "eza -l --sort=created";      # sort by created time

     # git-aware
     lgit  = "eza -l --git";               # show git status
     lx    = "eza -lbhHigUmuS --git";      # extended info with git

     # tree (default depth 3)
     lt    = "eza --tree --level=3";       # tree, depth 3 by default
     lta   = "eza -a --tree --level=3";    # tree with hidden files, depth 3
     llt   = "eza -l --tree --level=3";    # long tree, depth 3
     llta  = "eza -la --tree --level=3";   # long tree with hidden files, depth 3
   };
in 
{
  flake.modules.homeManager.terminal = {
  programs.fish = {
   enable = true;

   interactiveShellInit = ''
     set -g fish_greeting
   '';

   shellAliases = myAlias;
   shellAbbrs = myAlias;

   # -- nx: system configuration management --

   functions = {
     __nx_stage = ''
       echo ""
       set_color -o blue
       echo -n "==> "
       set_color normal
       echo "$argv[1]"
     '';

     __nx_diff_dirty = ''
       # -N stages new files by path only (no content), so they show up
       # in the diff below as additions instead of being invisible
       git -C /home/indransh/.nixos add -N -A
       git -C /home/indransh/.nixos diff
     '';

     __nx_commit_if_dirty = ''
       set -l changes (git -C /home/indransh/.nixos status --porcelain)
       if test (count $changes) -gt 0
         __nx_stage "Changes to commit:"
         __nx_diff_dirty
         git -C /home/indransh/.nixos add -A
         git -C /home/indransh/.nixos commit -m "$argv[1]"
       end
     '';

     __nx_config_files = ''
       # walk the import graph starting at flake.nix, following relative-path
       # nix file references, so new modules are picked up automatically
       set -l root /home/indransh/.nixos
       set -l seen $root/flake.nix
       set -l queue $root/flake.nix
       while test (count $queue) -gt 0
         set -l f $queue[1]
         set -e queue[1]
         set -l dir (path dirname $f)
         for rel in (sed -E 's/#.*$//' $f 2>/dev/null | grep -ohE '\.\.?/[A-Za-z0-9_./-]+\.nix')
           set -l full (realpath -m $dir/$rel)
           if not contains $full $seen
             set -a seen $full
             set -a queue $full
           end
         end
       end
       for f in $seen
         echo $f
       end
     '';

     nx = ''
       switch "$argv[1]"
         case deploy
           __nx_stage "Checking for local changes"
           __nx_commit_if_dirty "nx: auto-commit before deploy"
           __nx_stage "Building and switching to the new configuration"
           nh os switch -H nixos 

         case up
           __nx_stage "Updating flake inputs"
	   nh os switch -H nixos --update
           and nx deploy

         case clean
           __nx_stage "Collecting garbage"
           nh clean all --keep 3

         case config
           __nx_stage "Opening configuration files"
           set -q EDITOR
           or set -l EDITOR vi
           $EDITOR (__nx_config_files)

         case push
           __nx_stage "Checking for local changes"
           __nx_commit_if_dirty "nx: update"
           __nx_stage "Pushing to remote"
           git -C /home/indransh/.nixos push

         case nuke-history
           echo "WARNING: this permanently deletes ALL git history in /home/indransh/.nixos."
           echo "Every file will be committed fresh as a single \"initial commit\","
           echo "which is then force-pushed, overwriting the remote history too."
           echo "This cannot be undone."
           echo ""
           read -l -P "Continue? [y/N] " confirm
           switch "$confirm"
             case y Y yes Yes YES
               set -l changes (git -C /home/indransh/.nixos status --porcelain)
               if test (count $changes) -gt 0
                 __nx_stage "Local changes that will be swept into the new history:"
                 __nx_diff_dirty
               end
               __nx_stage "Squashing history into a single commit"
               set -l branch (git -C /home/indransh/.nixos branch --show-current)
               set -l remote (git -C /home/indransh/.nixos remote | head -n1)
               git -C /home/indransh/.nixos checkout --orphan __nx_nuke_tmp
               and git -C /home/indransh/.nixos add -A
               and git -C /home/indransh/.nixos commit -m "initial commit"
               and git -C /home/indransh/.nixos branch -D $branch
               and git -C /home/indransh/.nixos branch -m $branch
               and __nx_stage "Force-pushing rewritten history"
               and git -C /home/indransh/.nixos push --force --set-upstream $remote $branch
             case '*'
               echo "Aborted."
           end

         case doctor
           __nx_stage "Running full maintenance cycle (up, clean, push)"
           nx up
           and nx clean
           and nx push

         case '*'
           echo "nx — manage the NixOS configuration in /home/indransh/.nixos"
           echo ""
           echo "Usage: nx <command>"
           echo ""
           echo "Commands:"
           echo "  deploy        commit pending changes, then build and switch to the flake"
           echo "  up            update flake.lock and all packages, then deploy"
           echo "  clean         garbage-collect the system (nix-collect-garbage -d)"
           echo "  config        open flake.nix and everything it imports in \$EDITOR"
           echo "  push          commit pending changes and push to the remote"
           echo "  nuke-history  squash all git history into one \"initial commit\" and force-push"
           echo "  doctor        up + clean + push"
       end
     '';

     starship_transient_prompt_func = ''
	starship module character 
     '';

     starship_transient_rprompt_func = ''
	starship module time 
     '';


   };

   completions = {
     nx = ''
       complete -c nx -f
       complete -c nx -n __fish_use_subcommand -a deploy -d 'commit, build and switch to the flake'
       complete -c nx -n __fish_use_subcommand -a up -d 'update flake and packages'
       complete -c nx -n __fish_use_subcommand -a clean -d 'garbage-collect the system'
       complete -c nx -n __fish_use_subcommand -a config -d 'open config files in $EDITOR'
       complete -c nx -n __fish_use_subcommand -a push -d 'commit and push changes'
       complete -c nx -n __fish_use_subcommand -a nuke-history -d 'squash all history into one commit and force-push'
       complete -c nx -n __fish_use_subcommand -a doctor -d 'up + clean + push'
       complete -c nx -n __fish_use_subcommand -a '--help' -d 'show help'
     '';
   };
 };
};
}
