package test

import (
	"testing"

	"github.com/xwi88/gp"
)

func Test_HalfPlusTwoCpu(t *testing.T) {
	// register model
	modelName := "saved_model_half_plus_two_cpu"
	var tags []string
	tags = []string{"serve"}
	exportDir := "../testdata/saved_model_half_plus_two_cpu/default"
	gp.RegisterTFModelWithParamName(modelName, exportDir, tags, []string{"x"}, "y")
	rm := gp.GetModel(modelName)
	t.Logf("register model: %v", rm)
}
