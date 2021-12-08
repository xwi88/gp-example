package test

import (
	"math/rand"
	"testing"
	"time"

	"github.com/xwi88/gp"
)

func Test_CtrFM(t *testing.T) {
	// register model
	modelName := "ctr-fm_v1"
	// tags := []string{}
	tags := []string{"serve"}
	exportDir := "../testdata/ctr-fm/ctr-fm_v1_0"
	gp.RegisterTFModelWithParamName(modelName, exportDir, tags, []string{"StatefulPartitionedCall"}, "serving_default_input")
	rm := gp.GetModel(modelName)
	t.Logf("register model: %v", rm)

	size := 0_3
	for i := 0; i < size; i++ {
		rand.Seed(time.Now().UnixNano())
		inputS := [][39]float64{{0}, {0}, {1}}
		// predict with the special model
		output, err := gp.Predict(modelName, []interface{}{inputS})
		if err != nil {
			t.Logf("Predict err: %v", err)
		}
		_ = output
		t.Logf("output: %v\n", output)
	}
}
