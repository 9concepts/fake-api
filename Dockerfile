FROM ocaml/opam:ubuntu-20.04-ocaml-5.0
ENV LANG ja_JP.UTF-8
ENV TZ Asia/Tokyo

# Required from opium
RUN sudo apt-get install -y libev-dev pkg-config

RUN opam install --yes \
  utop \
  ocamlformat \
  opium
