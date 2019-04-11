# aglio

## Usage

To run aglio with the current directory mounted to `/docs`:

```
THEME=onlicar
#THEME=dlio
#THEME=peperoncino
docker run -ti --rm -v $PWD:/docs gustavohenrique/aglio -t ${THEME} --theme-full-width --theme-variables=slate <path to your file .apib>
```
