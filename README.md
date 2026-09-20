# fattman2008/homebrew-tap

Shared Homebrew tap.

## Install Lead (`pt`)

```bash
brew install fattman2008/tap/lead
pt setup
pt doctor
```

Pulls peer dependencies: [`worktrunk`](https://formulae.brew.sh/formula/worktrunk) and [`withgraphite/tap/graphite`](https://github.com/withgraphite/homebrew-tap).

On Homebrew 6+, trust the taps if prompted:

```bash
brew trust fattman2008/tap
brew trust withgraphite/tap
```
