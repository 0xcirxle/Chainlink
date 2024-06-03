pragma circom 2.1.5;

include "@zk-email/zk-regex-circom/circuits/regex_helpers.circom";

// regex:  (A A P L | A M Z N | M S F T | G O O G)
template stockSymbolRegex(msg_bytes) {
	signal input msg[msg_bytes];
	signal output out;

	var num_bytes = msg_bytes+1;
	signal in[num_bytes];
	in[0]<==255;
	for (var i = 0; i < msg_bytes; i++) {
		in[i+1] <== msg[i];
	}

	component eq[12][num_bytes];
	component and[31][num_bytes];
	component multi_or[2][num_bytes];
	signal states[num_bytes+1][29];
	signal states_tmp[num_bytes+1][29];
	signal from_zero_enabled[num_bytes+1];
	from_zero_enabled[num_bytes] <== 0;
	component state_changed[num_bytes];

	for (var i = 1; i < 29; i++) {
		states[0][i] <== 0;
	}

	for (var i = 0; i < num_bytes; i++) {
		state_changed[i] = MultiOR(28);
		states[i][0] <== 1;
		eq[0][i] = IsEqual();
		eq[0][i].in[0] <== in[i];
		eq[0][i].in[1] <== 32;
		and[0][i] = AND();
		and[0][i].a <== states[i][0];
		and[0][i].b <== eq[0][i].out;
		states_tmp[i+1][1] <== 0;
		and[1][i] = AND();
		and[1][i].a <== states[i][1];
		and[1][i].b <== eq[0][i].out;
		states[i+1][2] <== and[1][i].out;
		eq[1][i] = IsEqual();
		eq[1][i].in[0] <== in[i];
		eq[1][i].in[1] <== 65;
		and[2][i] = AND();
		and[2][i].a <== states[i][1];
		and[2][i].b <== eq[1][i].out;
		states[i+1][3] <== and[2][i].out;
		and[3][i] = AND();
		and[3][i].a <== states[i][3];
		and[3][i].b <== eq[0][i].out;
		states[i+1][4] <== and[3][i].out;
		and[4][i] = AND();
		and[4][i].a <== states[i][2];
		and[4][i].b <== eq[1][i].out;
		states[i+1][5] <== and[4][i].out;
		eq[2][i] = IsEqual();
		eq[2][i].in[0] <== in[i];
		eq[2][i].in[1] <== 71;
		and[5][i] = AND();
		and[5][i].a <== states[i][2];
		and[5][i].b <== eq[2][i].out;
		states[i+1][6] <== and[5][i].out;
		eq[3][i] = IsEqual();
		eq[3][i].in[0] <== in[i];
		eq[3][i].in[1] <== 77;
		and[6][i] = AND();
		and[6][i].a <== states[i][2];
		and[6][i].b <== eq[3][i].out;
		states[i+1][7] <== and[6][i].out;
		and[7][i] = AND();
		and[7][i].a <== states[i][4];
		and[7][i].b <== eq[1][i].out;
		states[i+1][8] <== and[7][i].out;
		and[8][i] = AND();
		and[8][i].a <== states[i][7];
		and[8][i].b <== eq[0][i].out;
		states[i+1][9] <== and[8][i].out;
		and[9][i] = AND();
		and[9][i].a <== states[i][6];
		and[9][i].b <== eq[0][i].out;
		states[i+1][10] <== and[9][i].out;
		and[10][i] = AND();
		and[10][i].a <== states[i][5];
		and[10][i].b <== eq[0][i].out;
		states[i+1][11] <== and[10][i].out;
		and[11][i] = AND();
		and[11][i].a <== states[i][8];
		and[11][i].b <== eq[0][i].out;
		states[i+1][12] <== and[11][i].out;
		eq[4][i] = IsEqual();
		eq[4][i].in[0] <== in[i];
		eq[4][i].in[1] <== 83;
		and[12][i] = AND();
		and[12][i].a <== states[i][9];
		and[12][i].b <== eq[4][i].out;
		states[i+1][13] <== and[12][i].out;
		eq[5][i] = IsEqual();
		eq[5][i].in[0] <== in[i];
		eq[5][i].in[1] <== 79;
		and[13][i] = AND();
		and[13][i].a <== states[i][10];
		and[13][i].b <== eq[5][i].out;
		states[i+1][14] <== and[13][i].out;
		and[14][i] = AND();
		and[14][i].a <== states[i][11];
		and[14][i].b <== eq[3][i].out;
		states[i+1][15] <== and[14][i].out;
		eq[6][i] = IsEqual();
		eq[6][i].in[0] <== in[i];
		eq[6][i].in[1] <== 80;
		and[15][i] = AND();
		and[15][i].a <== states[i][12];
		and[15][i].b <== eq[6][i].out;
		states[i+1][16] <== and[15][i].out;
		and[16][i] = AND();
		and[16][i].a <== states[i][13];
		and[16][i].b <== eq[0][i].out;
		states[i+1][17] <== and[16][i].out;
		and[17][i] = AND();
		and[17][i].a <== states[i][14];
		and[17][i].b <== eq[0][i].out;
		states[i+1][18] <== and[17][i].out;
		and[18][i] = AND();
		and[18][i].a <== states[i][15];
		and[18][i].b <== eq[0][i].out;
		states[i+1][19] <== and[18][i].out;
		and[19][i] = AND();
		and[19][i].a <== states[i][16];
		and[19][i].b <== eq[0][i].out;
		states[i+1][20] <== and[19][i].out;
		eq[7][i] = IsEqual();
		eq[7][i].in[0] <== in[i];
		eq[7][i].in[1] <== 70;
		and[20][i] = AND();
		and[20][i].a <== states[i][17];
		and[20][i].b <== eq[7][i].out;
		states[i+1][21] <== and[20][i].out;
		and[21][i] = AND();
		and[21][i].a <== states[i][18];
		and[21][i].b <== eq[5][i].out;
		states[i+1][22] <== and[21][i].out;
		eq[8][i] = IsEqual();
		eq[8][i].in[0] <== in[i];
		eq[8][i].in[1] <== 90;
		and[22][i] = AND();
		and[22][i].a <== states[i][19];
		and[22][i].b <== eq[8][i].out;
		states[i+1][23] <== and[22][i].out;
		eq[9][i] = IsEqual();
		eq[9][i].in[0] <== in[i];
		eq[9][i].in[1] <== 76;
		and[23][i] = AND();
		and[23][i].a <== states[i][20];
		and[23][i].b <== eq[9][i].out;
		eq[10][i] = IsEqual();
		eq[10][i].in[0] <== in[i];
		eq[10][i].in[1] <== 84;
		and[24][i] = AND();
		and[24][i].a <== states[i][25];
		and[24][i].b <== eq[10][i].out;
		eq[11][i] = IsEqual();
		eq[11][i].in[0] <== in[i];
		eq[11][i].in[1] <== 78;
		and[25][i] = AND();
		and[25][i].a <== states[i][27];
		and[25][i].b <== eq[11][i].out;
		multi_or[0][i] = MultiOR(3);
		multi_or[0][i].in[0] <== and[23][i].out;
		multi_or[0][i].in[1] <== and[24][i].out;
		multi_or[0][i].in[2] <== and[25][i].out;
		states[i+1][24] <== multi_or[0][i].out;
		and[26][i] = AND();
		and[26][i].a <== states[i][21];
		and[26][i].b <== eq[0][i].out;
		states[i+1][25] <== and[26][i].out;
		and[27][i] = AND();
		and[27][i].a <== states[i][22];
		and[27][i].b <== eq[0][i].out;
		states[i+1][26] <== and[27][i].out;
		and[28][i] = AND();
		and[28][i].a <== states[i][23];
		and[28][i].b <== eq[0][i].out;
		states[i+1][27] <== and[28][i].out;
		and[29][i] = AND();
		and[29][i].a <== states[i][24];
		and[29][i].b <== eq[0][i].out;
		and[30][i] = AND();
		and[30][i].a <== states[i][26];
		and[30][i].b <== eq[2][i].out;
		multi_or[1][i] = MultiOR(2);
		multi_or[1][i].in[0] <== and[29][i].out;
		multi_or[1][i].in[1] <== and[30][i].out;
		states[i+1][28] <== multi_or[1][i].out;
		from_zero_enabled[i] <== MultiNOR(28)([states_tmp[i+1][1], states[i+1][2], states[i+1][3], states[i+1][4], states[i+1][5], states[i+1][6], states[i+1][7], states[i+1][8], states[i+1][9], states[i+1][10], states[i+1][11], states[i+1][12], states[i+1][13], states[i+1][14], states[i+1][15], states[i+1][16], states[i+1][17], states[i+1][18], states[i+1][19], states[i+1][20], states[i+1][21], states[i+1][22], states[i+1][23], states[i+1][24], states[i+1][25], states[i+1][26], states[i+1][27], states[i+1][28]]);
		states[i+1][1] <== MultiOR(2)([states_tmp[i+1][1], from_zero_enabled[i] * and[0][i].out]);
		state_changed[i].in[0] <== states[i+1][1];
		state_changed[i].in[1] <== states[i+1][2];
		state_changed[i].in[2] <== states[i+1][3];
		state_changed[i].in[3] <== states[i+1][4];
		state_changed[i].in[4] <== states[i+1][5];
		state_changed[i].in[5] <== states[i+1][6];
		state_changed[i].in[6] <== states[i+1][7];
		state_changed[i].in[7] <== states[i+1][8];
		state_changed[i].in[8] <== states[i+1][9];
		state_changed[i].in[9] <== states[i+1][10];
		state_changed[i].in[10] <== states[i+1][11];
		state_changed[i].in[11] <== states[i+1][12];
		state_changed[i].in[12] <== states[i+1][13];
		state_changed[i].in[13] <== states[i+1][14];
		state_changed[i].in[14] <== states[i+1][15];
		state_changed[i].in[15] <== states[i+1][16];
		state_changed[i].in[16] <== states[i+1][17];
		state_changed[i].in[17] <== states[i+1][18];
		state_changed[i].in[18] <== states[i+1][19];
		state_changed[i].in[19] <== states[i+1][20];
		state_changed[i].in[20] <== states[i+1][21];
		state_changed[i].in[21] <== states[i+1][22];
		state_changed[i].in[22] <== states[i+1][23];
		state_changed[i].in[23] <== states[i+1][24];
		state_changed[i].in[24] <== states[i+1][25];
		state_changed[i].in[25] <== states[i+1][26];
		state_changed[i].in[26] <== states[i+1][27];
		state_changed[i].in[27] <== states[i+1][28];
	}

	component is_accepted = MultiOR(num_bytes+1);
	for (var i = 0; i <= num_bytes; i++) {
		is_accepted.in[i] <== states[i][28];
	}
	out <== is_accepted.out;
	signal is_consecutive[msg_bytes+1][3];
	is_consecutive[msg_bytes][2] <== 0;
	for (var i = 0; i < msg_bytes; i++) {
		is_consecutive[msg_bytes-1-i][0] <== states[num_bytes-i][28] * (1 - is_consecutive[msg_bytes-i][2]) + is_consecutive[msg_bytes-i][2];
		is_consecutive[msg_bytes-1-i][1] <== state_changed[msg_bytes-i].out * is_consecutive[msg_bytes-1-i][0];
		is_consecutive[msg_bytes-1-i][2] <== ORAnd()([(1 - from_zero_enabled[msg_bytes-i+1]), states[num_bytes-i][28], is_consecutive[msg_bytes-1-i][1]]);
	}
	// substrings calculated: [{(0, 1), (1, 2), (1, 3), (2, 5), (2, 6), (2, 7), (3, 4), (4, 8), (5, 11), (6, 10), (7, 9), (8, 12), (9, 13), (10, 14), (11, 15), (12, 16), (13, 17), (14, 18), (15, 19), (16, 20), (17, 21), (18, 22), (19, 23), (20, 24), (21, 25), (22, 26), (23, 27), (24, 28), (25, 24), (26, 28), (27, 24)}]
	signal prev_states0[31][msg_bytes];
	signal is_substr0[msg_bytes];
	signal is_reveal0[msg_bytes];
	signal output reveal0[msg_bytes];
	for (var i = 0; i < msg_bytes; i++) {
		 // the 0-th substring transitions: [(0, 1), (1, 2), (1, 3), (2, 5), (2, 6), (2, 7), (3, 4), (4, 8), (5, 11), (6, 10), (7, 9), (8, 12), (9, 13), (10, 14), (11, 15), (12, 16), (13, 17), (14, 18), (15, 19), (16, 20), (17, 21), (18, 22), (19, 23), (20, 24), (21, 25), (22, 26), (23, 27), (24, 28), (25, 24), (26, 28), (27, 24)]
		prev_states0[0][i] <== from_zero_enabled[i+1] * states[i+1][0];
		prev_states0[1][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][1];
		prev_states0[2][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][1];
		prev_states0[3][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][2];
		prev_states0[4][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][2];
		prev_states0[5][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][2];
		prev_states0[6][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][3];
		prev_states0[7][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][4];
		prev_states0[8][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][5];
		prev_states0[9][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][6];
		prev_states0[10][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][7];
		prev_states0[11][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][8];
		prev_states0[12][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][9];
		prev_states0[13][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][10];
		prev_states0[14][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][11];
		prev_states0[15][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][12];
		prev_states0[16][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][13];
		prev_states0[17][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][14];
		prev_states0[18][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][15];
		prev_states0[19][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][16];
		prev_states0[20][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][17];
		prev_states0[21][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][18];
		prev_states0[22][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][19];
		prev_states0[23][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][20];
		prev_states0[24][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][21];
		prev_states0[25][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][22];
		prev_states0[26][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][23];
		prev_states0[27][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][24];
		prev_states0[28][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][25];
		prev_states0[29][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][26];
		prev_states0[30][i] <== (1 - from_zero_enabled[i+1]) * states[i+1][27];
		is_substr0[i] <== MultiOR(31)([prev_states0[0][i] * states[i+2][1], prev_states0[1][i] * states[i+2][2], prev_states0[2][i] * states[i+2][3], prev_states0[3][i] * states[i+2][5], prev_states0[4][i] * states[i+2][6], prev_states0[5][i] * states[i+2][7], prev_states0[6][i] * states[i+2][4], prev_states0[7][i] * states[i+2][8], prev_states0[8][i] * states[i+2][11], prev_states0[9][i] * states[i+2][10], prev_states0[10][i] * states[i+2][9], prev_states0[11][i] * states[i+2][12], prev_states0[12][i] * states[i+2][13], prev_states0[13][i] * states[i+2][14], prev_states0[14][i] * states[i+2][15], prev_states0[15][i] * states[i+2][16], prev_states0[16][i] * states[i+2][17], prev_states0[17][i] * states[i+2][18], prev_states0[18][i] * states[i+2][19], prev_states0[19][i] * states[i+2][20], prev_states0[20][i] * states[i+2][21], prev_states0[21][i] * states[i+2][22], prev_states0[22][i] * states[i+2][23], prev_states0[23][i] * states[i+2][24], prev_states0[24][i] * states[i+2][25], prev_states0[25][i] * states[i+2][26], prev_states0[26][i] * states[i+2][27], prev_states0[27][i] * states[i+2][28], prev_states0[28][i] * states[i+2][24], prev_states0[29][i] * states[i+2][28], prev_states0[30][i] * states[i+2][24]]);
		is_reveal0[i] <== MultiAND(3)([out, is_substr0[i], is_consecutive[i][2]]);
		reveal0[i] <== in[i+1] * is_reveal0[i];
	}
}