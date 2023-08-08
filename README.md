# ArchLinux: Battery discharging

Command-line tool that makes a sound whenever the computer's battery is not connected to electrical power.

## INFORMATION

### USAGE:

`battery-discharging [OPTIONS]`

### DESCRIPTION

Command-line tool that makes a sound whenever the computer's battery is not connected to electrical power.

- Recommendation:
    - Run this tool in the background so that it detects the absence of electrical power in the battery at all times.
    - For example: `battery-discharging &`.

### ARGS:

- None.

### OPTIONS:

| **Abbr** | **Long**         | **Information**                                                                                                                                                                                                                                                                                                      |
|----------|------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| -d       | --duration       | The duration of the beep.<br> - Required: no<br> - Type: integer \| float<br> - Values: 1<br> - Default: 0.2                                                                                                                                                                                                         |
| -f       | --frequency      | The frequency of the beep. Low values are low sounds, and high values are high sounds.<br> - Required: no<br> - Type: integer<br> - Values: 1500<br> - Default: 2000                                                                                                                                                 |
| -h       | --help           | Display information for this command and exit.<br> - Required: no<br> - Type: none<br> - Values: none<br> - Default: none                                                                                                                                                                                            |
| -p       | --path           | The path of the directory where the list of power supply devices is located.<br> - Required: no<br> - Type: string<br> - Values: /dev/battery<br> - Default: /sys/class/power_supply                                                                                                                                 |
| -s       | --status         | Linux stores the battery status in a file.<br>Text that must match within the battery file.<br>The text is not case-sensitive.<br> - Required: no<br> - Type: string<br> - Values: Disconnected<br> - Default: Discharging                                                                                           |
| -t       | --test           | Try the beep a certain number of times and exit.<br>This is used with the `--duration`, `--frequency` and `--wait` options.<br>Note: This option must go at the end of the other options. Otherwise, the other options will have no effect.<br> - Required: no<br> - Type: integer<br> - Values: 15<br> - Default: 3 |
| -v       | --version        | Display the version of this tool along with the project information and exit.<br> - Required: no<br> - Type: none<br> - Values: none<br> - Default: none                                                                                                                                                             |
|          | --version-simple | Display the version of this tool and exit.<br> - Required: no<br> - Type: none<br> - Values: none<br> - Default: none                                                                                                                                                                                                |
| -w       | --wait           | Waiting time between one beep and another.<br> - Required: no<br> - Type: integer \| float<br> - Values: 5<br> - Default: 2.5                                                                                                                                                                                        |

### EXAMPLES:

- Default values.
    - Commands:
        - `battery-discharging`
        - `battery-discharging &`

- Test the beep six times with a frequency of 1250, a duration of 0.5 seconds,
  and a wait between each beep of 1.3 seconds.
    - **Note:** This option must go at the end of the other options. Otherwise, the other options will have no effect.
    - Commands:
        - `battery-discharging --frequency 1250 --duration 0.5 --wait 1.3 --test 6`
        - `battery-discharging -f 1250 -d 0.5 -w 1.3 -t 6`

- Assigns the frequency of the beep.
    - Commands:
        - `battery-discharging --frequency 400`
        - `battery-discharging -f 400`

- Assigns the duration of the beep.
    - Commands:
        - `battery-discharging --duration 1.2`
        - `battery-discharging -d 1.2`

- Assign the wait between one beep and another.
    - Commands:
        - `battery-discharging --wait 7.7`
        - `battery-discharging -w 7.7`

- Assign the path where the Linux files related to the power supply are
  located.
    - Commands:
        - `battery-discharging --path /udev/system/power_supply`
        - `battery-discharging -p /udev/system/power_supply`

- Assign the text that must be matched within the Linux file related to the
  power supply.
    - Commands:
        - `battery-discharging --status 'Not connected'`
        - `battery-discharging -s 'Not connected'`

- Multiple options can be used multiple times. It will only take the last
  value of each option.
    - In this example it will set the frequency to 15.
        - `battery-discharging --frequency 321 --frequency 123456 --frequency 15`

## INSTALLATION AND MANUAL EXECUTION

### Installation

#### Introduction

This package is stored in the AUR (Arch Linux User Repository). AUR is a repository where anyone with an Arch Linux web
account can upload a configuration file, which has instructions for downloading and installing the package. In addition,
it contains information on the people who maintain or contribute to it.

#### AUR package installer

Normally, the `pacman` command is used to install official packages. However, this command does not work for AUR
packages. There are specific tools that help AUR package management, like `yay`.

To install this package, first [install yay][install yay] and then run the following
command: `yay --sync battery-discharging`.

### Manual execution

[Directly download][raw file of this package] the [battery-discharging][this package file] file and use it on your
computer.

Verify that the file has the appropriate execution permissions for your needs: `ls -l battery-discharging`. You can
add execute permissions to the owner user with `chmod u+x battery-discharging` or to all
with `chmod +x battery-discharging`.

Run this tool with one of the following commands.

- `./battery-discharging --help`.
- `bash battery-discharging --help`.
- `/usr/bin/env bash battery-discharging --help`.
- `/usr/bin/bash battery-discharging --help`.

## CONTRIBUTE

You can always follow the official GitHub guides: [contributing to projects][contributing to projects]
and [fork a repository][fork a repository].

In short, you can perform the following steps. Let's assume your GitHub user is `XxXxXx`.

Here is a small script that can be run after the first step, which is to fork the project in your account.

```bash
#!/usr/bin/env bash

# Replace these two values to customize your execution.
MY_GITHUB_USER="XxXxXx"
BRANCH_NAME="add-new-options"

git clone "https://github.com/${MY_GITHUB_USER}/archlinux-battery-discharging.git"
cd archlinux-battery-discharging
git remote add upstream "https://github.com/airvzxf/archlinux-battery-discharging.git"
git remote --verbose
git branch "${BRANCH_NAME}"
git checkout "${BRANCH_NAME}"
```

- Navigate to [archlinux-battery-discharging][optional packages GitHub project] and create a branch by clicking the
  branch
  button. Or just click this [link to create it automatically][fork optional packages project].
- On your computer, clone your forked project: `git clone https://github.com/XxXxXx/archlinux-battery-discharging.git`.
- Go inside the repository folder: `cd archlinux-battery-discharging`.
- Configure Git to sync your fork with the upstream repository.
    - `git remote add upstream https://github.com/airvzxf/archlinux-battery-discharging.git`.
    - `git remote --verbose`.
- Always create a new branch to work on your changes.
    - `git branch BRANCH_NAME`.
    - `git checkout BRANCH_NAME`.
- Make your changes and commit them.
    - `git add .`.
    - `git commit --message "Brief description of the changes"`.
- Push your changes to our repository on the GitHub server. The first time you need to specify the upstream, the next
  time use basic push.
    - First time: `git push --set-upstream origin BRANCH_NAME`.
    - `git push`.
- The last step is to create a pull request to push your changes to our repository. This request must
  be accepted by the project owner or maintainers for the changes to take effect.
    - If you go to your repository with the web browser (`https://github.com/XxXxXx/archlinux-battery-discharging`), it
      will display the 'Compare & pull request' button. Or use this URL to do it
      easily: `https://github.com/XxXxXx/archlinux-battery-discharging/compare/BRANCH_NAME`
    - Fill in all the required information and review the 'Files changed' tab to verify the changes.
    - Tap the 'Create pull request' button to finish.

## RELEASE TO THE AUR SERVER

Use the version format vX.X.X, where X equals to numbers, for example: v45.7.211.

### Change in the source code.

- Manually change the version in [./src/battery-discharging][this package file]. Find the variable `VERSION="vX.X.X"`
  in the first few lines and change it to the new version.
- Check if the variable `ENV_IS_PRODUCTION` has the `true` value
  in [.github/workflows/deploy-to-aur.yml][deploy workflow in GitHub] file.

### Create a [new release][new release url].

- You can choose between a branch or a specific commitment.
    - If your commit is the latest at this time, you can select the 'main' branch.
    - Otherwise, if your commit is old, it's better to choose a specific commit.
- Create a new tag that is larger than the previous one (vX.X.X).
- Add a release title. Preferred to use 'Release vX.X.X'.
- Add a description. It is recommended to add a brief description and use the 'Generate release notes' button.
- Select the option: 'Set as the latest release'.
- Finally, tap the 'Publish release' button.

### Review in the '[CI ➟ Deploy to AUR][CI deploy to AUR]' actions.

- A new workflow run should be started with the title of the version you added in the previous steps.
- It validates that it has finished successfully (green color). If not, review the bug, fix it, and rebuild this
  version.
- If it finished successfully, in the logs at the end, it provides an AUR URL for this specific commit on its servers.
- You can check the [AUR repository information][AUR repository].
- You can check the [package in the AUR website][AUR webpage package].

## TO-DO LIST

### RELEASE

- [ ] Version of this tool. It is not defined, and we have to find the best approach. But definitely, the expectation is
  to look for the simplest and most automated way.
    - Option #1: When you create the release on GitHub, automatically modify the source code by changing the version in
      the script file. Furthermore, make a new commit with these changes, along with a push, and modify in the release
      the commit that is pointed to this last commit.
    - Option #2: It is precisely the opposite of Option #1. The version is assigned in the script or a file. Then find a
      way to automate the release and have it grab the version of the script or file on GitHub. Or even that the release
      is already automated with line commands and not through the website on GitHub, creating an action in the workflow.

- [ ] Create a system service to run this command at startup.

[AUR repository]: https://aur.archlinux.org/cgit/aur.git/?h=battery-discharging

[AUR webpage package]: https://aur.archlinux.org/packages/battery-discharging

[CI deploy to AUR]: https://github.com/airvzxf/archlinux-battery-discharging/actions/workflows/deploy-to-aur.yml

[contributing to projects]: https://docs.github.com/en/get-started/quickstart/contributing-to-projects

[deploy workflow in GitHub]: .github/workflows/deploy-to-aur.yml

[fork a repository]: https://docs.github.com/en/get-started/quickstart/contributing-to-projects#creating-a-branch-to-work-on

[fork optional packages project]: https://github.com/airvzxf/archlinux-battery-discharging/fork

[install yay]: https://github.com/Jguer/yay#installation

[new release url]: https://github.com/airvzxf/archlinux-battery-discharging/releases/new

[optional packages GitHub project]: https://github.com/airvzxf/archlinux-battery-discharging

[raw file of this package]: https://raw.githubusercontent.com/airvzxf/archlinux-battery-discharging/main/src/battery-discharging

[this package file]: ./src/battery-discharging
