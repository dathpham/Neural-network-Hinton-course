function ret = cd1(rbm_w, visible_data)
% <rbm_w> is a matrix of size <number of hidden units> by <number of visible units>
% <visible_data> is a (possibly but not necessarily binary) matrix of size <number of visible units> by <number of data cases>
% The returned value is the gradient approximation produced by CD-1. It's of the same shape as <rbm_w>.
% error('not yet implemented');


visible_data = sample_bernoulli(visible_data);
hid_cond = visible_state_to_hidden_probabilities(rbm_w, visible_data);
hid1=sample_bernoulli(hid_cond);
g1=configuration_goodness_gradient(visible_data, hid1);
vis_cond = hidden_state_to_visible_probabilities(rbm_w, hid1);
vis1=sample_bernoulli(vis_cond);
hid1_cond = visible_state_to_hidden_probabilities(rbm_w, vis1);
hid2 = hid1_cond;
g2=configuration_goodness_gradient(vis1, hid2);

ret = g1.-g2;



end
