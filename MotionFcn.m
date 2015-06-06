function MotionFcn(FigH, EventData)
get(FigH, 'CurrentPoint')
get(get(FigH, 'CurrentAxes'), 'CurrentPoint')