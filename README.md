# slides

The slides of the exercises of *Advanced computing for medical applications*, as HTML,
published with GitHub Pages at <https://ac4ma.github.io/slides/>.

| Exercise | Slides |
|---|---|
| 2 — From a DICOM CT to Geant4 voxels | [exercise-2](https://ac4ma.github.io/slides/exercise-2/) |

## Update the slides

The source of each presentation is `exercise-N/slides.ipynb`, with its outputs saved.
Edit it, then rebuild the HTML and push:

```sh
./build.sh
git add . && git commit -m "Update slides" && git push
```

`build.sh` converts the notebooks as they are, without running them. The cells read the data
of the exercise (`data/...`): to run them again, copy the notebook into the exercise template
folder, run it there, and copy it back.

When you add an exercise, add a line to `index.html` and to the table above.

## GitHub Pages

Settings → Pages → *Deploy from a branch*, branch `main`, folder `/ (root)`.
The empty `.nojekyll` file tells Pages to serve the files as they are.
