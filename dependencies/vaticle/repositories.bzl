load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def vaticle_dependencies():
    git_repository(
        name = "vaticle_dependencies",
        remote = "https://github.com/vaticle/dependencies",
        commit = "465e60776ca3055ce85d90e94624d37db3f7e790", # sync-marker: do not remove this comment, this is used for sync-dependencies by @vaticle_dependencies
    )

def vaticle_web_main():
    git_repository(
        name = "vaticle_web_main",
        remote = "git@github.com:vaticle/web-main.git",
        commit = "0b2bf9501362c060318b2116005736d0a876c75d", # sync-marker: do not remove this comment, this is used for sync-dependencies by @vaticle_web_main
    )
