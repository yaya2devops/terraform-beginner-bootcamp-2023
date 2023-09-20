# [SemVer](https://semver.org/)

This branch is dedicated to teach you how to branch, issue and tag stuff as required with semver.

Semantic Versioning is a versioning scheme for software that aims to provide a clear and predictable way of communicating changes and updates to a software package.

It's particularly important in the world of software development, as it helps developers and users understand the nature and impact of updates, ensuring compatibility and smooth transitions between different versions of a software package.

Semantic Versioning follows a three-part version number format: MAJOR.MINOR.PATCH. Each part of the version number carries specific meaning:

- **MAJOR:** This digit is incremented when there are incompatible changes that require users to make significant adjustments to their code or configurations. It signifies major updates or changes that could break existing functionality.
- **MINOR:** The minor version is incremented when new features are added in a backward-compatible manner. This means that while new functionality is introduced, existing code and configurations should still work without any issues.
- **PATCH:** The patch version is incremented for backward-compatible bug fixes or minor improvements that do not introduce new features. These updates typically address issues and improve the overall stability of the software.

Additionally, Semantic Versioning allows for the inclusion of pre-release and build metadata:

- **Pre-release:** This is a hyphen followed by an identifier for pre-release versions. Pre-release versions are for development and testing purposes and may not be stable for production use. For example, 1.0.0-alpha.1 or 2.0.0-beta.2.
- **Build metadata:** This is a plus sign followed by build metadata, which can be used to specify information about the build process or other details relevant to the release.

Here's an example table illustrating how Semantic Versioning works:

| Version       | Meaning                                        |
| ------------- | ---------------------------------------------- |
| 1.0.0         | Initial release                                |
| 1.1.0         | Added new features, backward-compatible        |
| 1.1.1         | Bug fix, backward-compatible                   |
| 2.0.0         | Incompatible changes, significant upgrade      |
| 2.0.1         | Bug fix, backward-compatible                   |
| 2.1.0         | Added new features, backward-compatible        |
| 3.0.0-alpha.1 | Pre-release version, not stable for production |
| 3.0.0-beta.1  | Pre-release version, for testing and feedback  |
| 3.0.0         | Stable release, backward-compatible            |

Semantic Versioning helps you and your friends understand the impact of updates at a glance.

It promotes transparency, reduces compatibility issues, and ensures smoother software development and deployment processes.

| Developers | You are encouraged to follow SemVer to provide a consistent and reliable experience to their users. |
| ---------- | --------------------------------------------------------------------------------------------------- |
