FROM alpine:edge

WORKDIR /workspace

COPY bin .

# 'make' IS NOT included in 'qmake'
RUN apk update \
    && apk add --no-cache g++ make \
        qt5-qtbase-dev \
		qt5-qtdeclarative-dev \
		qt5-qttools-dev \
		qt5-qtscript-dev

# The name of the .pro file will be
# the name of the exec.
RUN qmake -o Makefile main.pro

RUN make

CMD ["./main"]