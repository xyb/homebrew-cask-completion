# Fish completion script for brew-cask(1)

function __fish_brew_cask_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'brew-cask' ]
    return 0
  end
  return 1
end

function __fish_brew_cask_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

function __fish_brew_cask_casks
  ls (brew --repository)/Library/Taps/caskroom/homebrew-cask/Casks/*.rb | sed 's/.rb$//' | sed "s|^.*/||"
end

function __fish_brew_cask_caskroom
  ls /opt/homebrew-cask/Caskroom/
end

function __fish_brew_cask_installed_casks
  brew-cask list -1
end


############
# commands #
############

# alfred
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -a alfred -d 'Displays note about new built-in alfred support'

# audit
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -a audit -d 'Check casks'
complete -f -c brew-cask -n '__fish_brew_cask_using_command audit' -a '(__fish_brew_cask_casks)'

# cat
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -a cat -d 'Display cask'
complete -f -c brew-cask -n '__fish_brew_cask_using_command cat' -a '(__fish_brew_cask_casks)'

# cleanup
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -a cleanup -d 'Clean up cached downloads and tracker symlinks'
complete -f -c brew-cask -n '__fish_brew_cask_using_command cleanup' -l outdated -d 'Only clean up cached downloads older than 10 days old'
complete -f -c brew-cask -n '__fish_brew_cask_using_command cleanup' -a '(__fish_brew_cask_installed_casks)'

# create
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -a create -d 'Generate a Cask definition file'

# doctor
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -a 'doctor dr' -d 'Check for configuration issues'

# edit
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -a 'edit' -d 'Open cask definition file for editing'
complete -f -c brew-cask -n '__fish_brew_cask_using_command edit' -a '(__fish_brew_cask_casks)'

# fetch
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -a fetch -d 'Download resources for cask'
complete -f -c brew-cask -n '__fish_brew_cask_using_command fetch' -l force -d 'Force re-download even if the resources are already cached'
complete -f -c brew-cask -n '__fish_brew_cask_using_command fetch' -a '(__fish_brew_cask_casks)'

# help
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -a 'help' -d 'Display help'

# home
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -a 'home homepage' -d 'Open cask\'s homepage'
complete -c brew-cask -n '__fish_brew_cask_using_command home' -a '(__fish_brew_cask_casks)'

# info
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -a 'info abv' -d 'Display information about cask'
complete -c brew-cask -n '__fish_brew_cask_using_command info' -a '(__fish_brew_cask_casks)'

# install
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -a 'install' -d 'Install cask'
complete -f -c brew-cask -n '__fish_brew_cask_using_command install' -l force -d 'Force install'
complete -c brew-cask -n '__fish_brew_cask_using_command install' -a '(__fish_brew_cask_casks)'

# list
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -a 'list ls' -d 'List all installed casks'
complete -f -c brew-cask -n '__fish_brew_cask_using_command list' -s 1 -d 'Always format the output in a single column'
complete -f -c brew-cask -n '__fish_brew_cask_using_command ls' -s 1 -d 'Always format the output in a single column'
complete -f -c brew-cask -n '__fish_brew_cask_using_command list' -s l -d 'Give a more detailed listing'
complete -f -c brew-cask -n '__fish_brew_cask_using_command ls' -s l -d 'Give a more detailed listing'
complete -c brew-cask -n '__fish_brew_cask_using_command list' -a '(__fish_brew_cask_casks)'
complete -c brew-cask -n '__fish_brew_cask_using_command ls' -a '(__fish_brew_cask_casks)'

# search
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -a 'search -S' -d 'Display all casks or search by name'

# uninstall
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -a 'uninstall remove rm' -d 'Uninstall cask'
complete -f -c brew-cask -n '__fish_brew_cask_using_command uninstall' -a '(__fish_brew_cask_installed_casks)'
complete -f -c brew-cask -n '__fish_brew_cask_using_command remove' -a '(__fish_brew_cask_installed_casks)'
complete -f -c brew-cask -n '__fish_brew_cask_using_command rm' -a '(__fish_brew_cask_installed_casks)'
complete -f -c brew-cask -n '__fish_brew_cask_using_command uninstall' -l force -d 'Uninstall even cask not present'
complete -f -c brew-cask -n '__fish_brew_cask_using_command remove' -l force -d 'Uninstall even cask not present'
complete -f -c brew-cask -n '__fish_brew_cask_using_command rm' -l force -d 'Uninstall even cask not present'

# update
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -a update -d 'A synonym for brew update'
complete -f -c brew-cask -n '__fish_brew_cask_using_command update' -l rebase -d 'Use git pull --rebase'

# zap
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -a zap -d 'Unconditionally remove all files associated with casks'
complete -c brew-cask -n '__fish_brew_cask_using_command zap' -a '(__fish_brew_cask_caskroom)'


############
# switches #
############

# --force
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -l force -d 'Force install cask even exists'

# --caskroom
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -l caskroom -d 'Location of the Caskroom, where all binaries are stored'

# --verbose
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -l verbose -d 'Give additional feedback during installation'

# --appdir
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -l appdir -d 'Target location for Application links'

# --colorpickerdir
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -l appdir -d 'Target location for Color Picker links'

# --prefpanedir
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -l prefpanedir -d 'Target location for Preference Pane links'

# --qlplugindir
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -l qlplugindir -d 'Target location for QuickLook Plugin links'

# --fontdir
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -l fontdir -d 'Target location for Font links'

# --servicedir
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -l servicedir -d 'Target location for Service links'

# --input_methoddir
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -l input_methoddir -d 'Target location for Input Method links'

# --internet_plugindir
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -l internet_plugindir -d 'Target location for Internet Plugin links'

# --screen_saverdir
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -l screen_saverdir -d 'Target location for Screen Saver links'

# --no-binaries
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -l no-binaries -d 'Do not link ahelpera executables to /usr/local/bin'

# --binarydir
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -l binarydir -d 'Target location for ahelpera executable links'

# --debug
complete -f -c brew-cask -n '__fish_brew_cask_needs_command' -l debug -d 'Output debugging information'
