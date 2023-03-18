import lightgbm
import numpy as np
def check_gpu_support():
    try:
        data = np.random.rand(50, 2)
        label = np.random.randint(2, size=50)
        train_data = lightgbm.Dataset(data, label=label)
        params = {'num_iterations': 1, 'device': 'gpu'}
        gbm = lightgbm.train(params, train_set=train_data)
        return True
    except Exception as e:
        return False

print(check_gpu_support())
