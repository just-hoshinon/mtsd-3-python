import numpy
from fastapi import APIRouter
from fastapi.responses import JSONResponse

router = APIRouter()


@router.get('')
def hello_world() -> dict:
    return {'msg': 'Hello, World!'}


@router.get('/matrixes')
def get_matrix():
    A = numpy.random.random_integers(0, 5, (10, 10))
    B = numpy.random.random_integers(0, 5, (10, 10))
    product = A.dot(B).tolist()
    return JSONResponse(content={
        'matrix_A': A.tolist(),
        'matrix_B': B.tolist(),
        'product': product,
    })
