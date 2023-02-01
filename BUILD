load("@vaticle_bazel_distribution//common:rules.bzl", "assemble_targz")
load("@vaticle_dependencies//distribution:deployment.bzl", "deployment")
load("@vaticle_bazel_distribution//artifact:rules.bzl", "deploy_artifact")

WEB_DOCS_DIST_ADDITIONAL_FILES = {
    "//server/resources:conf/web-docs.properties": "resources/conf/web-docs.properties",
    "//server:server-bin_deploy.jar": "server.jar",
}

WEB_DOCS_DEV_DIST_ADDITIONAL_FILES = {
    "//server/resources:conf/web-docs-dev.properties": "resources/conf/web-docs.properties",
    "//server:server-bin_deploy.jar": "server.jar",
}

assemble_targz(
    name = "web-docs",
    additional_files = WEB_DOCS_DIST_ADDITIONAL_FILES,
    targets = [
        "//pages",
    ],
    output_filename = "web-docs"
)

assemble_targz(
    name = "web-docs-dev",
    additional_files = WEB_DOCS_DEV_DIST_ADDITIONAL_FILES,
    targets = [
        "//pages",
    ],
    output_filename = "web-docs-dev"
)

deploy_artifact(
    name = "deploy-web-docs",
    target = ":web-docs",
    artifact_group = "vaticle_web_docs",
    artifact_name = "web-docs-{version}.tar.gz",
    release = deployment['artifact.release'],
    snapshot = deployment['artifact.snapshot'],
)

deploy_artifact(
    name = "deploy-web-docs-dev",
    target = ":web-docs-dev",
    artifact_group = "vaticle_web_docs",
    artifact_name = "web-docs-{version}.tar.gz",
    release = deployment['artifact.release'],
    snapshot = deployment['artifact.snapshot'],
)

filegroup(
    name = "ci",
    data = [
        "@vaticle_dependencies//tool/release/version:bump",
    ],
)
