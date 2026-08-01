function check_virtualenv() {
  if [[ -n "$VIRTUAL_ENV" && ! -e "$PWD/.venv" ]]; then
    deactivate
  fi

  if [[ -e ".venv/bin/activate" && -z "$VIRTUAL_ENV" ]]; then
    export VIRTUAL_ENV_DISABLE_PROMPT=1
    source .venv/bin/activate
  fi

  if [[ -n "$VIRTUAL_ENV" ]]; then
    VENV_PROMPT="${VIRTUAL_ENV:t}"
  else
    VENV_PROMPT=""
  fi
}
