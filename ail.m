clc; close; clear;

training_set_inputs = [0 0 1; 1 1 1; 1 0 1; 0 1 1];
training_set_outputs = [0;1;1;0];
for seed = 1:4
    rng(seed); synaptic_weights = 2*rand(3,1) - 1;
    sqrer = zeros(1,1000);
    k = 1:1000;
    for i = 1:1000
        output = 1./(1 + exp(-training_set_inputs * synaptic_weights));
        sqrer(1,i) = mean((1./(1 + exp(-training_set_inputs * synaptic_weights)) - training_set_outputs).^2);
        synaptic_weights = synaptic_weights + training_set_inputs' * ((training_set_outputs - output) .* output .* (1 - output));
    end
    subplot(2,2,seed)
    result = 1 / (1 + exp(-[1 1 0]*synaptic_weights))
    disp(synaptic_weights)
    plot(k,sqrer);
    grid on; axis([0 100 0 0.4]);
end