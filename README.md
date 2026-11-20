# slides

The slides of the exercises of *Advanced computing for medical applications*, as HTML,
published with GitHub Pages at <https://ac4ma.github.io/slides/>.

| Exercise | Slides |
|---|---|
| 2 — From a DICOM CT to Geant4 voxels | [exercise-2](https://ac4ma.github.io/slides/exercise-2/) |

## Update the slides

The source is the `slides.ipynb` notebook in each exercise template. With the templates
cloned next to this repository (`../exercise-N-template`) and Jupyter installed:

```sh
./build.sh
git add . && git commit -m "Update slides" && git push
```

When you add an exercise, add a line to `index.html` and to the table above.

## GitHub Pages

Settings → Pages → *Deploy from a branch*, branch `main`, folder `/ (root)`.
The empty `.nojekyll` file tells Pages to serve the files as they are.
