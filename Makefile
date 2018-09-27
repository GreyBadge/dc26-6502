# Copyright (C) 2018, Vi Grey
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.

PKG_NAME := dc26-6502
CURRENTDIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
DIRNAME := $(shell basename $(CURRENTDIR))

all:
	mkdir -p $(CURRENTDIR)bin; \
  cd $(CURRENTDIR)src; \
  asm $(PKG_NAME).asm ../bin/$(PKG_NAME).nes; \
  cd ../bin; \
  zip -F dc26-6502.nes --out new.zip; \
  tail -c $$(expr $$(wc -c < dc26-6502.nes) - \
                  $$(wc -c < new.zip)) dc26-6502.nes >> new.zip; \
  mv new.zip dc26-6502.nes; \
  cd ..; \
  echo ""; \
  echo "NES ROM SUCCESSFULLY COMPILED"; \

clean:
	rm -rf $(CURRENTDIR)bin
