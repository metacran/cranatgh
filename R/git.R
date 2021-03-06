
#' Run a git command using system git
#'
#' System git must be properly installed and it must be in the `PATH`.
#'
#' It throws an error on error.
#'
#' @param ... Arguments to pass to git.
#' @param env Named character vector, environment variables
#'   to set for git.
#' @param timeout Timeout, in seconds, defaults to one hour.
#' @return Return value from [processx::run()].
#'
#' @keywords internal

git <- function(..., env = character(), timeout = 60 * 60) {
  processx::run(
    "git",
    args = unlist(list(...)),
    env = c(Sys.getenv(), env)
  )
}

#' Create an empty local git tree
#'
#' Created within the current working directory.
#'
#' @param package Package name, directory to create a git tree in.
#' @return The return value of the call to git.
#'
#' @importFrom cli cli_alert_info
#' @keywords internal

create_git_repo <- function(path) {
  dir.create(path)
  wd <- getwd()
  on.exit(setwd(wd), add = TRUE)
  setwd(path)
  cli_alert_info("Creating git repo in {.path {path}}")
  git("init", ".")
}

set_git_user <- function(path, user = NULL, email = NULL) {

  user <- user %||% default_cranatgh_user()
  email <- email %||% default_cranatgh_email()

  withr::with_dir(path, {
    git("config", "--local", "user.name", user)
    git("config", "--local", "user.email", email)
  })
}
