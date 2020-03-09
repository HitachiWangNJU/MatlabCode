function LimitOut = LimitLevel(LimitIn,LimitMax,LimitMin)
LimitIn(LimitIn > LimitMax) = LimitMax;
LimitIn(LimitIn < LimitMin) = LimitMin;
LimitOut = LimitIn;