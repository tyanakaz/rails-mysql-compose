#!/bin/sh

rails new .  \
--devcontainer
--database=mysql  \
--skip-action-mailer \
--skip-action-mailbox  \
--javascript=esbuild  \
--css=tailwind  \
--force   \
-m template.rb